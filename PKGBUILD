# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk-git
_pkgname=clerk
pkgver=944.0bbc0b7
pkgrel=1
conflicts=('clerk-legacy')
provides=('clerk')
pkgdesc="rofi/fzf driven mpd client"
arch=('any')
url='https://github.com/carnager/clerk'
license=('MIT')
depends=('perl' 'perl-data-section-simple' 'fzf' 'rofi' 'tmux' 'perl-net-mpd' 'perl-data-messagepack' 'perl-file-slurper' 'perl-config-simple' 'perl-try-tiny' 'perl-ipc-run' 'perl-http-date')
install=clerk-git.install
makedepends=('git')
optdepends=('flac: tagging support'
			'vorbis-tools: tagging support'
			'python-mutagen: tagging support')
source=('git+https://github.com/carnager/clerk')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 ${srcdir}/clerk/clerk.pl "${pkgdir}/usr/bin/clerk"
    install -D -m 644 ${srcdir}/clerk/clerk_rating_client.service "${pkgdir}/usr/lib/systemd/user/clerk_rating_client.service"
    install -D -m 755 ${srcdir}/clerk/clerk_rating_client "${pkgdir}/usr/bin/clerk_rating_client"
}
md5sums=('SKIP')
