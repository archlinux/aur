# Maintainer: chris <c6ristian AT christian DOT moe>

pkgname=routinator-bin
provides=('routinator')
conflicts=('routinator' 'routinator-git')
pkgver=0.15.2
pkgrel=1
arch=('x86_64')
options=('!debug')
pkgdesc="An RPKI Validator and RTR server written in Rust"
url="https://nlnetlabs.nl/projects/routing/routinator/"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs' 'rsync')
backup=('etc/routinator/routinator.conf')
source=(
	"routinator_$pkgver.amd64.deb::https://packages.nlnetlabs.nl/linux/debian/pool/main/r/routinator/routinator_$pkgver-1trixie_amd64.deb"
	'routinator-sysusers.conf'
	'routinator-tmpfiles.conf'
)
sha256sums=('67f45fd72e9394c69c153f5e54e2d1bad6c04e8ce4492014bc9935388ef391e5'
            'ac2dd416119d1c526bdffe792d0e204bc9dc91a7cc198754cafb7fdde646c96a'
            'be4587d512bdf8ad98f3f93ac16b5cc1f5a423f4f16f088d66f960937b44c46f')

package() {
  tar -vxf data.tar.xz

  install -D -m0755 "${srcdir}/usr/bin/routinator" "${pkgdir}/usr/bin/routinator"
  install -D -m0644 "${srcdir}/etc/routinator/routinator.conf" "$pkgdir/etc/routinator/routinator.conf"
  install -D -m644 "${srcdir}/usr/lib/systemd/system/routinator.service" -t "$pkgdir/usr/lib/systemd/system"

  install -D -m644 "${srcdir}/usr/share/doc/routinator/README.md" -t "$pkgdir/usr/share/doc/routinator"

  install -D -m644 "${srcdir}/usr/share/man/man1/routinator.1.gz" -t "$pkgdir/usr/share/man/man1"
  install -D -m644 "${srcdir}/usr/share/doc/routinator/copyright" -t "$pkgdir/usr/share/licenses/routinator"

  install -D -m0644 "${srcdir}/routinator-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/routinator.conf"
  install -D -m0644 "${srcdir}/routinator-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/routinator.conf"
}
