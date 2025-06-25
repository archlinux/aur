# Maintainer: TransCoderLady <estela-zafiros-bv@proton.me>

pkgname=plymouth-theme-dervedro-cat-git
_themename=cat
pkgver=r22.4b5dc0c
pkgrel=1
pkgdesc="A lovely sleepy cat plymouth theme. Fork by derVedro."
arch=("any")
url="https://github.com/derVedro/PlymouthTheme-Cat"
license=("GPL-3.0-only")
depends=("plymouth")
makedepends=("git")
source=("git+https://github.com/derVedro/PlymouthTheme-Cat.git")
md5sums=("SKIP")

pkgver() {
    cd "PlymouthTheme-Cat"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/PlymouthTheme-Cat/cat"
  _themedir="${pkgdir}/usr/share/plymouth/themes/$_themename"

  for N in "${_themename}.plymouth" assets/*.png "${_themename}.script"; do
    install -Dm644 $N "${_themedir}/$N"
  done

  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"

}

