# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=guiless-bing-search
pkgver=r3.20260220.804252c
pkgrel=1
pkgdesc='A tool for accessing Bing search results in GUI-less environments'
arch=('any')
url='https://github.com/wszqkzqk/GUILessBingSearch'
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'qt6-webengine')
makedepends=('git')
backup=('etc/guiless-bing-search.conf')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    install -Dm755 guiless_bing_search.py "${pkgdir}/usr/bin/guiless-bing-search"
    install -Dm644 guiless-bing-search.service "${pkgdir}/usr/lib/systemd/system/guiless-bing-search.service"
    install -Dm644 guiless-bing-search.conf.example "${pkgdir}/etc/guiless-bing-search.conf"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
