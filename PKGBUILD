# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-infra-bin
_pkg=${pkgname//-bin/}
pkgver=1.55.1
pkgrel=1
pkgdesc="New Relic - All-in-On Observability - infrastructure agent"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/newrelic/infrastructure-agent/"
license=('Apache')
groups=('newrelic')
provides=('newrelic-infra')
conflicts=('newrelic-infra')
changelog="CHANGELOG"
backup=('etc/newrelic-infra/newrelic-infra.yml')
source=('https://raw.githubusercontent.com/newrelic/infrastructure-agent/master/assets/examples/infrastructure/newrelic-infra-template.yml.example')
source_aarch64=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz"{,.asc})
source_armv7h=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz"{,.asc})
source_x86_64=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz"{,.asc})
validpgpkeys=('A758B3FBCD43BE8D123A3476BB29EE038ECCE87C')

package() {
    # create destination directories
    mkdir -p ${pkgdir}/etc/${_pkg}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib/systemd/system/
    mkdir -p ${pkgdir}/var/db/${_pkg}/{custom-integrations,integrations.d,newrelic-integrations}

    install -m u=rw,go=r ${srcdir}/${_pkg}-template.yml.example ${pkgdir}/etc/${_pkg}/${_pkg}.yml
    install -m u=rw,go=r ${srcdir}/${_pkg}/etc/init_scripts/systemd/${_pkg}.service ${pkgdir}/usr/lib/systemd/system/
    install -m u=rwx,go=rx ${srcdir}/${_pkg}/usr/bin/* ${pkgdir}/usr/bin/
    install -m u=rw,go=r ${srcdir}/${_pkg}/var/db/${_pkg}/LICENSE.txt ${pkgdir}/var/db/${_pkg}/
}
sha256sums=('60f2a31b2d461f029c786a18f1feb393c1a5e43beac520b1c7d5e12b45590ae0')
sha256sums_aarch64=('a14883bba9f800b8ca23014e2daafa2dbd2a33777631c4c883c87f89a41da3eb'
                    'SKIP')
sha256sums_armv7h=('cb689ce34fc61a2b3b056a76f21fd1cdc4569a594b6dc1181d7a572479f39b0a'
                   'SKIP')
sha256sums_x86_64=('39813e9fa9a186ad4c49b39ec7543bb6e35785c36182d029c4750cfcaf5a3464'
                   'SKIP')
