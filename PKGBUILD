# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>
# Contributor: reflexing <reflexing@reflexing.ru>
# Contributor: Alexander Zubkov <green@msu.ru>
# Contributor: nsf

pkgname=ttf-paratype
pkgver=2.005
pkgrel=5
epoch=1
pkgdesc='ParaType font family with extended cyrillic and latin character sets'
arch=('any')
url='https://www.paratype.com'
license=('custom:OFL')

provides=(
	'ttf-font'
	'ttf-pt-sans'
	'ttf-pt-sans-expert'
	'ttf-pt-serif'
	'ttf-pt-serif-expert'
	'ttf-pt-mono'
)

source=(
	# PT Sans
	'https://info.paratype.ru/wp-content/uploads/2019/07/ptsans-1.zip'
	'https://info.paratype.ru/wp-content/uploads/2019/07/PTSansExpert.zip'

	# PT Serif
	'https://info.paratype.ru/wp-content/uploads/2019/07/ptserif.zip'
	'https://info.paratype.ru/wp-content/uploads/2019/07/ptserifexpert.zip'

	# PT Mono
	'https://info.paratype.ru/wp-content/uploads/2019/07/ptmono.zip'

	# Font config file
	'54-paratype.conf'
)
sha512sums=(
	# PT Sans
	'1fc836b60d226a2d21c3d03b4e4565e38031395256002ae1194f50d6053243ea3467a8702a17bca1ca17d0927549ddce96a45f27e55773b1810ae4a77cc8c319'
	'610e8aa80edb6f20d9ae5c534ea81b84b7207abdb2f698089ae41d7f838bf06d19680ae9646a9aff1b466b2fa339709a942a7de458f5ce3b9076a40a0d1b2f4f'

	# PT Serif
	'3f779f2776e38c91bfaa364412e7cb82c730a5a8a98cb747a4d50574f187392167d3587810a9eb6129952843ae1007c7e485fa35367609974eff3b5217099eb8'
	'19edff4885026045eb32a97ddb2a5724b3fd5034d6bb34a18529ae9497f99b32351256db15febe1fe002717f3691eb8a643f90669278386451922b4ba2252c34'

	# PT Mono
	'479f2c9067bd5631d9ac6ad61a91add41a99c2acdfec173386754891f6c8b6d78d4ec16bac73caaf816f751fa70857a7836a3733a35e3048d85f84c1ea9d734f'

	# Font config file
	'9848bb38fa4a2b437665182ac5e79c20411a615b1b5050bc1900fffd760e70a562ba0a6bfa3ad2bc88ee9bc4f7335063bf850e1937387d9ae22f4d72bb1cd5d3'
)

package() {
	# Create required directories
	mkdir -p \
		"${pkgdir}"/usr/share/fonts/TTF/ \
		"${pkgdir}"/usr/share/licenses/${pkgname}/ \
		"${pkgdir}"/usr/share/fontconfig/conf.{avail,default}/

	# Install font files
	cp "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF/

	# Install font config file
	cp "${srcdir}"/*.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/
	ln -sr "${pkgdir}"/usr/share/fontconfig/conf.avail/* "${pkgdir}"/usr/share/fontconfig/conf.default/

	# Install license
	cp "${srcdir}"/PT_FreeLicense_E.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
