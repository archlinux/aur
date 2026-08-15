# Maintainer: ChenPi11 <wushengwuxi-msctinoulk@outlook.com>
_gitname=cmd
pkgname=cmd-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A faithful reimplementation of the Windows cmd.exe command interpreter for Unix."
arch=('x86_64')
url="https://github.com/ChenPi11/cmd"
license=('GPLv3')
source=(
    "git+https://github.com/ChenPi11/${_gitname}.git"
    "LICENSE"
)
makedepends=('git' 'sh')
sha256sums=(
    'SKIP'
    'SKIP'
)
provides=('cmd')
conflicts=('cmd')
options=('!strip')

pkgver()
{
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    make -j$(nproc)
}

package() {
    install -Dm0755 "${srcdir}/${_gitname}/cmd.exe" -t "${pkgdir}/usr/bin/"
    install -Dm0755 "${srcdir}/${_gitname}/COMMAND.COM" -t "${pkgdir}/usr/bin/"
    ln -s "/usr/bin/cmd.exe" "${pkgdir}/usr/bin/cmd"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/cmd/"
}
