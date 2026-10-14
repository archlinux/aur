# Maintainer: Shira Nguyen <sn3446409@gmail.com>
# Packager: satcom886 <rostik.medved@gmail.com>

pkgname=rffmpeg-git
pkgver=r251.f54ac84
pkgrel=1
pkgdesc="Remote SSH FFmpeg wrapper tool"
arch=('any')
url="https://github.com/joshuaboniface/rffmpeg"
license=('GPL-3.0-only')
groups=()
depends=('python' 'python-yaml' 'python-click' 'python-psycopg2')
makedepends=('git')
optdepends=()
provides=('rffmpeg')
conflicts=('rffmpeg' 'rffmpeg-bin')
source=("rffmpeg::git+https://github.com/joshuaboniface/rffmpeg")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/rffmpeg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m 755 "$pkgdir/etc/rffmpeg"

    # Arch uses /dev/shm, not /run/shm
    sed 's|/run/shm|/dev/shm|g' "$srcdir/rffmpeg/rffmpeg.yml.sample" > "$pkgdir/etc/rffmpeg/rffmpeg.yml.sample"
    chmod 644 "$pkgdir/etc/rffmpeg/rffmpeg.yml.sample"

    install -D -m 755 "$srcdir/rffmpeg/rffmpeg" "$pkgdir/usr/bin/rffmpeg"
}
