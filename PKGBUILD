# Maintainer: XDwanj <xdwanj@qq.com>
pkgname="go-gsgm"
_pkgname="gsgm"
pkgver=0.1.3
pkgrel=1
pkgdesc="Gnu Single Game Manager,Linux端的游戏库管理工具,主要与 Lutris 一起使用,相辅相成,Go 版本。"
arch=(
    'x86_64'
)
url="https://github.com/XDwanj/go-gsgm"
license=('GPL-3.0')
depends=(
    'lutris>0.5.14'
)
conflicts=(
    "$pkgname"
    "$_pkgname"
)
provides=(
    "$pkgname"
    "$_pkgname"
)
source=(
    "https://github.com/XDwanj/go-gsgm/releases/download/v${pkgver}/go-gsgm"
    "https://raw.githubusercontent.com/XDwanj/go-gsgm/master/LICENSE"
)
sha256sums=('eaff837fb0e66f53ee62d8d9f58f4f5d930646ab4804e4cb69169f69fccb4d41'
'4002f795f7119311fc2413ef76e823dc38b3a59864c472c323c65089e1fd7861')

prepare() {
    cd "$srcdir"
    
    chmod +x "${pkgname}"
    
    ./${pkgname} gen lupes > "$srcdir/${_pkgname}-lupes"
    chmod +x "$srcdir/${_pkgname}-lupes"
    
    ./${pkgname} completion bash > "$srcdir/${_pkgname}.bash"
    ./${pkgname} completion fish > "$srcdir/${_pkgname}.fish"
    ./${pkgname} completion zsh > "$srcdir/${_pkgname}.zsh"
}

package() {
    cd "$srcdir"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm644 "$srcdir/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "$srcdir/${_pkgname}.zsh"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "$srcdir/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    
    install -Dm755 "$srcdir/${_pkgname}-lupes" "$pkgdir/usr/bin/${_pkgname}-lupes"
    install -Dm755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
