# Maintainer: crux <c-rrux@outlook.com>

_exec_name=kursor
pkgname=${_exec_name}-bin

pkgver=4.3.15
pkgrel=1
pkgdesc="Keyboard-driven mouse-cursor -- service (grid & glide-*) & cli (pos / click / move / moveto)"
arch=(x86_64)

_github_url=https://github.com/rruxx/${_exec_name}
_gitee_url=https://gitee.com/rrux/${_exec_name}
url="${_github_url} ${_gitee_url}"
_download_path="releases/download/v$pkgver/${_exec_name}-v$pkgver-${arch}_v3-unknown-linux-gnu.tar.zst"

license=('AGPL-3.0-or-later')
provides=("${_exec_name}=$pkgver")
conflicts=("${_exec_name}")
install="$pkgname.install"
depends=('glibc')

source=("${_github_url}/${_download_path}"  # github
        "${_gitee_url}/${_download_path}")  # gitee
sha256sums=('55760df8b1b0cedbe951810b195b27fbc04fa689ae1eaed63dfb076be9959a46'
            '55760df8b1b0cedbe951810b195b27fbc04fa689ae1eaed63dfb076be9959a46')

# Binary tarball — no build step needed, makepkg auto-extracts.

package() {
    install -Dm755 "$srcdir/${_exec_name}" \
        "$pkgdir/usr/bin/${_exec_name}"
    install -Dm644 "$srcdir/${_exec_name}d.service" \
        "$pkgdir/usr/lib/systemd/system/${_exec_name}d.service"
}
