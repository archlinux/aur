# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

_pkgname=gst
gopkgname=github.com/uetchy/gst
pkgname=ghq-gst
provides=("gst=5.0.4")
conflicts=("gst")
pkgver=5.0.4
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
  "73b5d5053da30fa27add59dc6464722152832ab451d8ca207db8fc0370056beb"
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
