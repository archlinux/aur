# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=zsh-eza-git
pkgver=r111.d6b0278
pkgrel=1
pkgdesc="Zsh plugin to replace command gnu/ls with eza-community/eza"
arch=(any)
url="https://github.com/z-shell/zsh-eza"
license=(MIT)
depends=(zsh eza)
makedepends=(git)
provides=(zsh-eza)
install=$pkgname.install
source=($pkgname::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$pkgname"
  install -vdm 755 "$pkgdir/usr/share/zsh/plugins/$provides"
  cp -v -r --no-preserve=all {docs,functions,LICENSE,$provides.plugin.zsh} "$pkgdir/usr/share/zsh/plugins/$provides"

  # docs
  install -vdm 755 "$pkgdir/usr/share/doc/$provides"
  ln -sv /usr/share/zsh/plugins/$provides/docs/README.md "$pkgdir/usr/share/doc/$provides/"

  # licence
  install -vdm 755 "$pkgdir/usr/share/licenses/$provides"
  ln -sv /usr/share/zsh/plugins/$provides/LICENSE "$pkgdir/usr/share/licenses/$provides/"
}
