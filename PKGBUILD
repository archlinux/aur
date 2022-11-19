# Maintainer:  dummyx <dummyxa at gmail dot com>
# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv
pkgname=vapoursynth-plugin-${_plug}
pkgver=r30
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166504'
license=('custom:WTFPL')
depends=('vapoursynth')
conflicts=('vapoursynth-plugin-fmtconv-git')
#Dirty workaround for not breaking the dependencies.
provides=('vapoursynth-plugin-fmtconv-git')
source=("http://ldesoras.free.fr/src/vs/${_plug}-${pkgver}.zip")
sha256sums=('f35dba222f2a4d998cd5f777e14382d21337f86fec8ba38832d577ad5795f2e6')

prepare() {
  cd build/unix
  autoreconf --verbose --install --force
}

build() {
  cd build/unix
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth
  make
}

package(){
  make -C build/unix DESTDIR="${pkgdir}" install
  (cd doc; for i in *.{html,png,css}; do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done)
  install -Dm644 doc/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
