# Maintainer: prg <prg-archlinux@xannode.com>
# Contributor: prg <prg-archlinux@xannode.com>
# Contributor: actionless <actionless dot loveless at gmail mf com>

_gitname=presets-projectm-classic
_gitname_textures=presets-milkdrop-texture-pack

pkgname=projectm-presets-classic-git
pkgver=2.g14a6244.2.gff8edf2
pkgrel=2
pkgdesc="Classic preset pack for projectM (git version)"
arch=('x86_64' 'i686')
url='https://github.com/projectM-visualizer/presets-projectm-classic'
license=('LGPL')
depends=('projectm-git' 'sdl2' 'libxext' 'glm' 'poco')
makedepends=('cmake')
source=("git+https://github.com/projectM-visualizer/${_gitname}"
	"git+https://github.com/projectM-visualizer/${_gitname_textures}")
sha256sums=('SKIP'
            'SKIP')
options=('!buildflags')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  printf '.'
  cd "${srcdir}/${_gitname_textures}"
  printf "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  printf '\n'
}

package() {
  mkdir -p "$pkgdir/usr/share/projectM/presets"
  cp -ar $srcdir/${_gitname}/* "$pkgdir/usr/share/projectM/presets"
  cp -ar $srcdir/${_gitname_textures}/textures "$pkgdir/usr/share/projectM/"
}
