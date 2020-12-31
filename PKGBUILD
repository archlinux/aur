# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

_pkgname=gst
gopkgname=github.com/uetchy/gst
pkgname=ghq-gst
provides=("gst=5.0.3")
conflicts=("gst")
pkgver=5.0.3
pkgrel=1
pkgdesc="a simple toolbox that offers additional commands over ghq enabled environment"
arch=("i686" "x86_64")
url="https://github.com/uetchy/gst"
license=("MIT")
makedepends=("go")
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  "46aba69724f9f30c86eb5ecd465690d9463815be794154315838a31d0714f400"
)
_archive=${_pkgname}-${pkgver}

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$gopkgname"
  mkdir --parents `dirname "$GOPATH/src/$gopkgname"`
  mv -Tv "${srcdir}/${_archive}" "$GOPATH/src/$gopkgname"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  cd $GOPATH/src/$gopkgname
  go build
}

package() {
  install -Dm755 "$srcdir/build/src/$gopkgname/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  install -Dm644 "$srcdir/build/src/$gopkgname/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
