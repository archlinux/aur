# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=gibo-bin
_pkgname="${pkgname%-bin}"
pkgver=3.0.23
pkgrel=1
pkgdesc='Command-line tool to help you easily access .gitignore boilerplates'
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/simonwhitaker/gibo"
license=('custom:UNLICENSE')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=gibo.install
source_x86_64=("${url}/releases/download/v${pkgver}/gibo_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/gibo_Linux_arm64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/gibo_Linux_i386.tar.gz")
source=("gibo.install")
b2sums=('a8516b43198e9353eaf0fe49d50cb50ea2ac096b0366deabd33795b2c6d52ede6264d5615acdf78117550dbd2dc13999bca66fc9d1b10a090e7cee344c487f97')
b2sums_x86_64=('ae5ea399da0dc81c3f21e8587ba50d145617e6e8f9e3a01d0d7e52bc48ae55dc58cc8bd0a4c001bbe05fa0a593b45f655443f26d3698c36b2d92b0e317543067')
b2sums_aarch64=('5753d70e4c172a32d3043dcce70f046cd721d66b883648fb84c2b7b6f98c0e1e7a46d6b21e71d7a2178c3a2cedbd2957595f6561f850d76ab754ef1b2b9b785c')
b2sums_i686=('a21df596c81f6c26d91bb3d890aa7a931ccbed32f7426fa46f24fd3feb4a0066b12de4f6b7191af564212a89729805efe7d6632a0906d18e343fd3a7447cff08')

build() {
    "$srcdir/gibo" completion bash >"$srcdir/gibo-completion.bash"
    "$srcdir/gibo" completion zsh  >"$srcdir/gibo-completion.zsh"
    "$srcdir/gibo" completion fish >"$srcdir/gibo.fish"
}

package() {
    install -Dm755 "$srcdir/gibo" "$pkgdir/usr/bin/gibo"

    # license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # bash
    mkdir -p "$pkgdir/usr/share/bash-completion"
    install -Dm644 "$srcdir/gibo-completion.bash" "$pkgdir/usr/share/bash-completion/completions/gibo"

    # zsh
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "$srcdir/gibo-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_gibo"

    # fish
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "$srcdir/gibo.fish" "$pkgdir/usr/share/fish/vendor_completions.d/gibo.fish"
}
