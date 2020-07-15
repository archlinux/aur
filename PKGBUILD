# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='cmdtools-git'
reponame='cmdtools'
pkgver=1.0.0
pkgrel=1
pkgdesc="Tools to manipulate, create, and view commands."
arch=('any')
url="https://github.com/binex-dsk/cmdtools"
license=('GPL3')
source=("src-${pkgver}::https://github.com/binex-dsk/${reponame}/releases/download/${pkgver}/src-${pkgver}.tar.gz")
depends=('shc')
md5sums=('ff7a69ed5fc64db79bc1a466946d96f2')

pkgver() {
  git clone "${url}.git" getver
  cd "getver"
  git describe --tags | sed 's/-/.r/;s/-/./'
}

package() {
        for i in `ls *cmd`; do
            shc -f "$i" -o "$i.comp"
	    install -Dm755 "$i.comp" "${pkgdir}/usr/bin/$i"
        done
}
