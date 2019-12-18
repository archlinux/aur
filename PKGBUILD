# Maintainer: Dustin Falgout <dustin@falgout.us>

pkgname=ttf-google-fonts-typewolf
_commit='e4361d27e1a23e92b815de3ae00d588a184454ca'
pkgver=19.12.git+37c0f8e
pkgrel=1
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project."
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('apache' 'custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
provides=(
	'adobe-source-sans-pro-fonts'
	'adobe-source-serif-pro-fonts'
	'ttf-alegreya'
	'ttf-alegreya-sans'
	'ttf-anonymous-pro'
	'ttf-archivo-narrow'
	'ttf-arvo'
	'ttf-biorhyme'
	'ttf-bitter'
	'ttf-cabin'
	'ttf-cardo'
	'ttf-chivo'
	'ttf-cormorant'
	'ttf-crimson-text'
	'ttf-domine'
	'ttf-eczar'
	'ttf-fira-sans'
	'ttf-gentium-basic'
	'ttf-inconsolata'
	'ttf-karla'
	'ttf-lato'
	'ttf-libre-baskerville'
	'ttf-libre-franklin'
	'ttf-lora'
	'ttf-merriweather'
	'ttf-montserrat'
	'ttf-neuton'
	'ttf-old-standard'
	'ttf-opensans'
	'ttf-play-fair-display'
	'ttf-poppins'
	'ttf-pt-sans'
	'ttf-pt-serif'
	'ttf-rajdhani'
	'ttf-raleway'
	'ttf-roboto'
	'ttf-roboto-slab'
	'ttf-rubik'
	'ttf-source-sans-pro'
	'ttf-source-serif-pro'
	'ttf-spacemono'
	'ttf-spectral'
	'ttf-worksans'
)
conflicts=(
	"${provides[@]/ttf-font/}"
	'ttf-adobe-fonts'
	'ttf-google-fonts-git'
	'ttf-google-fonts-opinionated-git'
)
source=("fonts-${_commit}.tar.gz::https://github.com/google/fonts/archive/${_commit}.tar.gz")
md5sums=('adb00c13a389fc044665007aa25e6b64')


package() {
	_fonts="${provides[@]//-/}" # Remove hyphens from each element in array.
	_fonts="${_fonts[@]//ttf/}" # Remove 'ttf' from each element in array.
	_regex="${_fonts[*]// /|}"  # Replace spaces with pipe symbols.

	install -dm755 "${pkgdir}/usr/share/fonts/TTF"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

	cd "${srcdir}/fonts-${_commit}"

	install -Dm644 ofl/raleway/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}"

	find . \
		-type f \
		-regextype egrep \
		-regex ".*(${_regex}).+\.ttf" \
		-execdir install -Dm644 '{}' "${pkgdir}/usr/share/fonts/TTF" \;

}

