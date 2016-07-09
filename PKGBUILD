# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=aur-auto-vote-git
_pkgname=${pkgname%-git}
_reponame=bin
pkgver=53.d330cce
pkgrel=1
pkgdesc="Automates voting on installed and uninstalled AUR packages"
arch=('any')
url="https://github.com/cryzed/bin"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-html5lib')
source=("git+https://github.com/cryzed/bin.git"
        "aur-auto-vote.service.skel"
        "aur-auto-vote.timer")
md5sums=('SKIP'
         'f9c35855bb3190a4ded470fa58c7541b'
         'f940f9816e5013c197d075d62c3cf64a')
install="${pkgname}.install"

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"

    install -D -m644 "$_reponame/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "$_reponame/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -D -m644 aur-auto-vote.service.skel  "$pkgdir/etc/systemd/system/aur-auto-vote.service.skel"
    install -D -m644 aur-auto-vote.timer "$pkgdir/etc/systemd/system/aur-auto-vote.timer"
}
