# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: ernest21 <ernest2193 at gmail dot com>

pkgname=crowd-greeter
pkgver=r35
pkgrel=2
pkgdesc='LightDM greeter that shows 3D avatars that the user can click on to login with'
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~lightdm-team/crowd-greeter/trunk"
license=('GPL3')
depends=('gtk3' 'lightdm' 'glu' 'libgl')
makedepends=('bzr' 'vala' 'gnome-common')
provides=(crowd-greeter{,-bzr}=$pkgver)
source=("bzr+lp:crowd-greeter" 'new-avatar.patch')
sha256sums=('SKIP'
            '3ba4449472944f0858d3e9a1c4863f6c50f8f94065a5d27e38ccff1d9c35a1cf')

pkgver() {
  cd crowd-greeter

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd crowd-greeter

  patch -Np1 < ../new-avatar.patch
  #cp ../*.md2 ../*.png data/
}

build() {
  cd crowd-greeter

  ./autogen.sh --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd crowd-greeter

  make DESTDIR="${pkgdir}" install
  #install ../*.md2 "${pkgdir}"/usr/share/crowd-greeter/
  #install ../*.png "${pkgdir}"/usr/share/crowd-greeter/
}
