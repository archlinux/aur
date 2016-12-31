# Maintainer: joel <aullidolunar at gmai1 d0t c0m>
# Contributor: Nazarov Pavel <genocid@rambler.ru>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=redhat-artwork
pkgver=22
pkgrel=1
pkgdesc="Artwork for Red Hat default look-and-feel (themes, icons) from Fedora"
arch=('i686' 'x86_64')
url="http://www.redhat.com"
license=("GPL")
depends=('gtk2')
conflicts=('xcursor-bluecurve' 'gtk-bluecurve-engine' 'bluecurve-metacity-theme' 'bluecurve-icon-theme' 'bluecurve-classic-metacity-theme')
provides=('xcursor-bluecurve' 'gtk-bluecurve-engine' 'bluecurve-metacity-theme' 'bluecurve-icon-theme' 'bluecurve-classic-metacity-theme')

_rhlink=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/$pkgver/Everything/source/SRPMS

source=(
	${_rhlink}/b/bluecurve-classic-metacity-theme-1.0.0-9.fc21.src.rpm
	${_rhlink}/b/bluecurve-gtk-themes-1.0.0-12.fc22.src.rpm
	${_rhlink}/b/bluecurve-icon-theme-8.0.2-11.fc21.src.rpm
	${_rhlink}/b/bluecurve-metacity-theme-1.0.0-9.fc21.src.rpm
	${_rhlink}/f/fedora-icon-theme-1.0.0-16.fc21.src.rpm
	${_rhlink}/f/fedorainfinity-backgrounds-0.0.5-10.fc21.src.rpm
	${_rhlink}/f/fedorainfinity-screensaver-theme-1.0.0-9.fc21.src.rpm
	${_rhlink}/f/fedora-logos-22.0.0-1.fc22.src.rpm
	${_rhlink}/f/fedora-remix-logos-1.0.0-8.fc21.src.rpm
)

sha256sums=(
	'0fa5dd0f9099306926cab6522eb7348a393bad843e1ed08a614887e20b817297'
	'2663ed272d4b41ff35fd6db0d5bf0622c78bf1013bfadea6b9e9596607232492'
	'13a24a591cace3611e9ff4b9e0f5f4f043e43569fa70efedab6c462a3ca216e1'
	'22ae5c0fbee174b3f5344cec0eef44ee8aaacdab38126da5372787ebca2b3daf'
	'1c7b3e6f9a7750740cfca4cd6e77f3d1183c04808e1ef7f33e1f745e11f1e7e8'
	'9d5c4727886db6bf7e51c53b2962085fb1d792236c9a2729720d28d48fd61326'
	'2715a427c90e8a51702dbf556e359ee4caa573ced19cc17b0685235a57b2e2a4'
	'a6ea753317a32337aa2dca1be94dd0b6773969729f2992edaf38f6f5f3836e9e'
	'8b9c4da4893e99f8d5ef3317530af03f93f60ee35a67e5fda7bd0d731dc499da'
)

package() {
    cd "$srcdir"
    for foo in *.tar.bz2; do
		tar jxf ${foo}
		echo "******** Begin ${foo:0:-8}"
		cd ${foo:0:-8}
		if test -f "configure"
		then
			./configure --prefix=/usr
			make DESTDIR=${pkgdir} install
		else
			find . -type f -name "*.png" -exec install -Dm644 '{}' "$pkgdir/usr/share/pixmaps/fedora/{}" \;
		fi
		echo "******** End ${foo:0:-8}"
		cd ..
    done
}
