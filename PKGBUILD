# Maintainer: Savino Jossi <savino.jossi@gmail.com>
# Maintainer: Harry Law <hasld@fea.st>

_pkgname=scientifica
pkgname=${_pkgname}-font
pkgver=1.0.2
pkgrel=2
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=(any)
url='https://github.com/NerdyPepper/scientifica'
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
conflicts=(scientifica-font)
provides=(scientifica-font)
install=$pkgname.install
source=(https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/regular/${_pkgname}-11.bdf
        https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/bold/${_pkgname}Bold-11.bdf)
md5sums=('1b23c948030e09bcac0bae375a0fca37'
         '3767c286c70e670a86ee50c3e30ebfac')

build() {
	cat << EOF > 75-yes-scientifica.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Accept scientifica font -->
	<selectfont>
		<acceptfont>
			<pattern>
				<patelt name="family">
					<string>scientifica</string>
				</patelt>
			</pattern>
		</acceptfont>
	</selectfont>
</fontconfig>
EOF
}

package() {
  install -Dm644 scientifica-11.bdf "${pkgdir}/usr/share/fonts/misc/scientifica-11.bdf"
	install -Dm644 scientificaBold-11.bdf "${pkgdir}/usr/share/fonts/misc/scientificaBold-11.bdf"
	install -Dm644 75-yes-scientifica.conf "${pkgdir}/etc/fonts/conf.avail/75-yes-scientifica.conf"
	install -dm755 "${pkgdir}/etc/fonts/conf.d"
	install -dm755 "${pkgdir}/usr/share/fonts"
	rm -vf "${pkgdir}/etc/fonts/conf.d/10-autohint.conf" "${pkgdir}/etc/fonts/conf.d/10-scale-bitmap-fonts.conf"
	rm -vf "${pkgdir}/etc/fonts/conf.d/70-no-bitmaps.conf"
	if [[ ! -f /etc/fonts/conf.d/70-yes-bitmaps.conf ]]; then
		ln -vfs -t "${pkgdir}/etc/fonts/conf.d" "${pkgdir}/etc/fonts/conf.avail/70-yes-bitmaps.conf"
  fi
	ln -vfs -t "${pkgdir}/etc/fonts/conf.d" "${pkgdir}/etc/fonts/conf.avail/75-yes-scientifica.conf"
}

# vim: set ft=sh ts=2 sw=2 et:
