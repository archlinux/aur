# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=zsh-git-prompt-git
pkgver=v0.3.r129.g11b83ba
pkgrel=1
pkgdesc="a nice and fast python based zsh-git-prompt (haskell support not packaged)"
arch=('x86_64' 'i686')
url="https://github.com/starcraftman/zsh-git-prompt.git"
license=('MIT')
depends=('python>=2.7.1')
conflicts=("zsh-git-prompt")
instdir=/usr/lib/${pkgname%-git}

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%-git}::git+${url}#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  install -dm755 "${pkgdir}${instdir}"
  install -Dm644 "${srcdir}/${pkgname%-git}/zshrc.sh" "${pkgdir}${instdir}/"
  install -Dm644 "${srcdir}/${pkgname%-git}/gitstatus.py" "${pkgdir}${instdir}/"
}

