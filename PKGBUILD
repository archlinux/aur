# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=neopo-git
_gitname="neopo"
pkgver=r361.5f269eb
pkgrel=1
pkgdesc="A lightweight solution for local Particle development."
arch=("x86_64" "aarch64")
url="https://github.com/nrobinson2000/neopo"
license=("custom")
provides=("neopo")
source=("git+https://github.com/nrobinson2000/neopo.git"
        "git+https://github.com/nrobinson2000/particle-cli-completion")
md5sums=('SKIP'
         'SKIP')
makedepends=("python-setuptools")
depends=("python" "vim" "git" "perl-archive-zip" "libusb" "jq")

optdepends=("visual-studio-code-bin: Particle Workbench IDE"
            "bash-completion: Bash completion")
optdepends_x86_64=("lib32-glibc: gcc-arm 5.3.1 support")
optdepends_aarch64=("dfu-util: flash devices with DFU"
                    "nodejs-lts-erbium: support for particle-cli"
                    "openocd-git: support for debugging")

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Particle completion script
  install -Dm 644 particle-cli-completion/particle \
    "${pkgdir}/usr/share/bash-completion/completions/particle"

  # Neopo pip package
  cd $_gitname
  python setup.py install --root="${pkgdir}/" --optimize=1
}
