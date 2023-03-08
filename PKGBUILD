# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=nftwatch-git
pkgver=20220722.66aa429
pkgrel=1
pkgdesc='Shows nftables policy in a more readable format'
url='https://github.com/flyingrhinonz/nftwatch'
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('nftables' 'python-yaml')
backup=("etc/nftwatch.yml")
source=('git+https://github.com/flyingrhinonz/nftwatch.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/nftwatch"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
    cd "${srcdir}/nftwatch"

    # systemd service
    install -vDm 755 "nftwatch" -t "${pkgdir}/usr/bin/"
    # license
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    # config
    install -vDm 644 "nftwatch.yml" -t "${pkgdir}/etc/"
}
