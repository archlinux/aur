# Maintainer: crux <c-rrux@outlook.com>

_exec_name=kursor
pkgname=${_exec_name}-bin

pkgver=4.3.13
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
sha256sums=('1854edfb5a7cfeae8240f3abeac3a4779f0e744b006c9df856dce8cab980c394'
            '1854edfb5a7cfeae8240f3abeac3a4779f0e744b006c9df856dce8cab980c394')

# Binary tarball — no build step needed, makepkg auto-extracts.

package() {
    install -Dm755 "$srcdir/${_exec_name}" \
        "$pkgdir/usr/bin/${_exec_name}"
    install -Dm644 "$srcdir/${_exec_name}d.service" \
        "$pkgdir/usr/lib/systemd/system/${_exec_name}d.service"
}
