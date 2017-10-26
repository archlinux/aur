# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk-git
_pkgname=clerk
pkgver=944.0bbc0b7
pkgrel=1
conflicts=('clerk')
provides=('clerk')
pkgdesc="rofi/fzf driven mpd client"
arch=('any')
url='https://github.com/carnager/clerk'
license=('MIT')
depends=('perl' 'fzf' 'rofi' 'tmux' 'perl-net-mpd' 'perl-data-messagepack' 'perl-file-slurper' 'perl-config-simple' 'perl-try-tiny' 'perl-ipc-run' 'perl-http-date')
install=clerk-git.install
makedepends=('git')
optdepends=('flac: tagging support'
			'vorbis-tools: tagging support'
			'mutagen: tagging support')
source=('git+https://github.com/carnager/clerk#branch=index')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 ${srcdir}/clerk/clerk.pl "${pkgdir}/usr/bin/clerk"
    install -D -m 755 ${srcdir}/clerk/clerk_rating_client.service "${pkgdir}/usr/lib/systemd/user/clerk_rating_client.service"
    install -D -m 755 ${srcdir}/clerk/clerk_rating_client "${pkgdir}/usr/bin/clerk_rating_client"
    install -D -m 755 ${srcdir}/clerk/clerk_setup "${pkgdir}/usr/bin/clerk_setup"
    install -D -m 644 ${srcdir}/clerk/clerk.conf "${pkgdir}/usr/share/doc/clerk/clerk.conf"
    install -D -m 644 ${srcdir}/clerk/clerk.tmux "${pkgdir}/usr/share/doc/clerk/clerk.tmux"
}
md5sums=('SKIP')
