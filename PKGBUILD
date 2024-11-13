# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-infra-bin
_pkg=${pkgname//-bin/}
pkgver=1.58.0
pkgrel=1
pkgdesc="New Relic - All-in-On Observability - infrastructure agent"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/newrelic/infrastructure-agent/"
license=('Apache')
groups=('newrelic')
provides=('newrelic-infra')
conflicts=('newrelic-infra')
#changelog="CHANGELOG"
backup=('etc/newrelic-infra/newrelic-infra.yml')
source=('https://raw.githubusercontent.com/newrelic/infrastructure-agent/master/assets/examples/infrastructure/newrelic-infra-template.yml.example')
source_aarch64=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz"{,.asc})
source_armv7h=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz"{,.asc})
source_x86_64=("https://github.com/newrelic/infrastructure-agent/releases/download/${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz"{,.asc})
sha256sums=('60f2a31b2d461f029c786a18f1feb393c1a5e43beac520b1c7d5e12b45590ae0')
sha256sums_aarch64=('cf7085e146f71caade18c2eacbf50dd778b6fb9c4d6a1f8ef227e33c4e8dc0bf'
                    'SKIP')
sha256sums_armv7h=('e0a3d6bdde711007ce08d0231466971541fcd38f1ea5eab47b3fcbd971142c44'
                   'SKIP')
sha256sums_x86_64=('928247af84e4c7ab4355bc1df8ffd945fda14779735a6244ba0ba8ed4aeb4a98'
                   'SKIP')
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
