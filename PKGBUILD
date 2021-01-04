# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=neopo-git
_gitname="neopo"
pkgver=r283.cbe6548
pkgrel=1
pkgdesc="A lightweight solution for local Particle development."
arch=('x86_64' 'aarch64')
url="https://github.com/nrobinson2000/neopo"
license=('custom')
provides=('neopo')
source=('git+https://github.com/nrobinson2000/neopo.git')
md5sums=('SKIP')
makedepends=('python-setuptools')
depends=('python' 'vim' 'git' 'perl-archive-zip' 'libusb')

optdepends=('visual-studio-code-bin: Particle Workbench IDE')
optdepends_x86_64=('lib32-glibc: gcc-arm 5.3.1 support')
optdepends_aarch64=('dfu-util: flash devices with DFU'
                    'nodejs: support for particle-cli'
                    'openocd-git: support for debugging')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitname
    python setup.py install --root="${pkgdir}/" --optimize=1
}
