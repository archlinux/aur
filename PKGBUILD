# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=gibo-bin
_pkgname="${pkgname%-bin}"
pkgver=3.0.16
pkgrel=2
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
b2sums_x86_64=('121afe8f24bd68bbd6677ee36e2adbaeae1933e1fd25ff835480b129aa04bbb33227edbb008741f926516e1445f37440d433e7b5ffac8722277f997c494cd7c5')
b2sums_aarch64=('ea9c029d9e5bf0372d3df3a9fde62118d8adf435a311d0449ea80bf8f9993f94efe604593fcb631166726dae17b6ce51bd3e1ed03a6d457b212b2d093967c572')
b2sums_i686=('9101eb1e2c40b5f857bec9ea8e8a56328b9094cf0d0ed0e9f2254666a09520fa0700bd1d13cfe33d7564a33e3e2e7af2a20e700a8c69ed596491cccd6ee2d80d')

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
