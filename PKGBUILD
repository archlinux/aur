# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=gede
pkgver=2.16.1
pkgrel=1
pkgdesc='Graphical frontend (GUI) to GDB written in Qt.'
arch=(i686 x86_64)
url='http://acidron.com/gede'
license=(BSD)
depends=(qt5-base gdb ctags)
makedepends=(python)
source=("http://gede.acidron.com/uploads/source/${pkgname}-${pkgver}.tar.xz"
        "do_not_build_on_install.patch")
sha256sums=('96ce371d39e7b5ed58b3a35e6bf8f72d17e2f8281e3e21ca8d71246cb8ee1b65'
            '65f0075eee147364cfcba6776de1389ceb4dbe066f6274da65470bf8bdd467b4')


prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/do_not_build_on_install.patch"
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python build.py --use-qt5
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python build.py install --prefix="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
