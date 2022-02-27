# Maintainer:  fzerorubigd <fzero at rubi dot gd>
# Contributor: Kyle McNally <kyle@kmcnally.net>
# Contributor: Matt Aitchison

pkgname=('plex-sub-zero-git')
pkgver=2.6.5.3247.r0.g6b918be7
pkgrel=1
pkgdesc='Subtitles for Plex, as good you would expect them to be'
arch=('any')
url='https://github.com/pannal/Sub-Zero.bundle'
license=('MIT')
options=('!strip')
depends=('python' 'plex-media-server')
source=("git+https://github.com/pannal/Sub-Zero.bundle.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Sub-Zero.bundle"
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	      )
	      
}

package() {
	install -D -m644 "${srcdir}/Sub-Zero.bundle/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle"
	cp -r "${srcdir}/Sub-Zero.bundle"/* "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle/"
}
