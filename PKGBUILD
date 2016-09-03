# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=replaceframes
pkgname=vapoursynth-plugin-${_plug}-hg
pkgver=4.37bd14b3cff3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (HG version)"
arch=('i686' 'x86_64')
url='https://bitbucket.org/James1201/vapoursynth-replaceframes'
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('mercurial')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::hg+https://bitbucket.org/James1201/vapoursynth-replaceframes")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(hg log -r -1 --template '{rev}.{node|short}\n')"
}

prepare() {
  cd "${_plug}"
  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure \
    --libdir="/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
