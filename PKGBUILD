# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=firefox-hwaccel
pkgver=1.0.0
pkgrel=1
pkgdesc='Enable VA-API hardware video decode in Firefox and forks'
arch=('any')
url='https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration'
license=('MIT')
depends=('vaapi-autoconfig')
source=('zzz-hwaccel.js' 'LICENSE')
sha256sums=('ed69ff4a1ba438557cb5e2be4303991737d017820edda3e4834f11cdf914febb'
            '2eb5cf5f51415ad4d11336f0771301ea309344d8b11b82a49d009290f71d3041')
install=firefox-hwaccel.install

package() {
    local _installed=false
    for dir in /usr/lib/*/browser/defaults/preferences/; do
        [ -d "$dir" ] || continue
        local _browser=$(echo "$dir" | cut -d/ -f4)
        install -Dm644 "$srcdir/zzz-hwaccel.js" \
            "$pkgdir/usr/lib/$_browser/browser/defaults/preferences/zzz-hwaccel.js"
        _installed=true
    done

    if ! $_installed; then
        install -Dm644 "$srcdir/zzz-hwaccel.js" \
            "$pkgdir/usr/lib/firefox/browser/defaults/preferences/zzz-hwaccel.js"
    fi

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
