

pkgname=uutils-coreutils-git-bin
pkgver=0.8.0.r101.g5daf0a5
pkgrel=1
pkgdesc="Rust rewrite of coreutils (latest-commit)"
url="https://github.com/uutils/coreutils/releases/download/latest-commit"
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
provides=(coreutils)
conflicts=({uutils-,}coreutils)
source=("${url}/individual-x86_64-unknown-linux-gnu.tar.zst" "${url}/docs.tar.zst")
b2sums=('SKIP' 'SKIP')
# todo: pkgver() {}
package(){
  for _b in arch kill more uptime hostname;do
    mv bin/$_b bin/uu-$_b
    rm share/man/man1/${_b}.1
    rm share/fish/vendor_completions.d/${_b}.fish
    rm share/zsh/site-functions/_${_b}
  done
  install -d "$pkgdir"/usr
  mv bin share "$pkgdir"/usr
}
