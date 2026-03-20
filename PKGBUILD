# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-infra-bin
_pkg=${pkgname//-bin/}
pkgver=1.72.8
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
sha256sums_aarch64=('c796d14029680e1b5f17e313dc304e541df21a05c8fc5858ad97292be34a6b76'
                    'SKIP')
sha256sums_armv7h=('205d6fd7fcba5c5da95c98719cc64b0346f69f68d5ca6ab71fb4068b413ec464'
                   'SKIP')
sha256sums_x86_64=('991bb220831be2ec81b1580b58deb51b0d43e0067397fb9b4b6189ac9af16f3b'
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
