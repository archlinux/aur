# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-infra-bin
_pkg=${pkgname//-bin/}
pkgver=1.72.9
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
sha256sums_aarch64=('402daa03f864f04387e079730822a1f7d53ce0cde23eb31053dbb067867e0cb8'
                    'SKIP')
sha256sums_armv7h=('229ddb18f9af6c92065430278be9b284000343a224de9cf47b6e2bc630ad3430'
                   'SKIP')
sha256sums_x86_64=('2a3c1a9a861bc46dc0d501671d966d2237eb67f4882796d1f5245e37fa28f421'
                   'SKIP')
validpgpkeys=('A758B3FBCD43BE8D123A3476BB29EE038ECCE87C'
              'D3EEEEE880A91DEE209A82CC4F9A9B5B96EC30B9')

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
