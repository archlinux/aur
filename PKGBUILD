# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=gede
pkgver=2.17.1
pkgrel=1
pkgdesc='Graphical frontend (GUI) to GDB written in Qt.'
arch=(x86_64)
url='https://gede.dexar.se/'
license=(BSD)
depends=(qt5-base gdb ctags)
makedepends=(python)
source=("http://gede.dexar.se/uploads/source/${pkgname}-${pkgver}.tar.xz"
        "do_not_build_on_install.patch")
sha256sums=('a323c7a347328efb0ff46ebbfe9979c733eb5a7f83405b53eb88be5fbdf07a41'
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
