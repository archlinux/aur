# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=splashboard
pkgname=${_pkgname}-bin
pkgver=2.9.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A customizable terminal splash screen with plugin-based data sources"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('ISC')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"home_daily-${pkgver}.toml::${_urlraw}/src/templates/home_daily.toml"
		"home_feed-${pkgver}.toml::${_urlraw}/src/templates/home_feed.toml"
		"home_github-${pkgver}.toml::${_urlraw}/src/templates/home_github.toml"
		"home_minimal-${pkgver}.toml::${_urlraw}/src/templates/home_minimal.toml"
		"home_splash-${pkgver}.toml::${_urlraw}/src/templates/home_splash.toml"
		"project_codebase-${pkgver}.toml::${_urlraw}/src/templates/project_codebase.toml"
		"project_github-${pkgver}.toml::${_urlraw}/src/templates/project_github.toml"
		"project_minimal-${pkgver}.toml::${_urlraw}/src/templates/project_minimal.toml"
		"project_splash-${pkgver}.toml::${_urlraw}/src/templates/project_splash.toml")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('16e5a239e6cb767747480dfd5707228219403b7ee0b02b9ea1b1f39f8819b1d7'
            '7efc86707cf14bfab0e6aa5c2dd630c9cf2c09a58bc3d18ccc9ccbad009cd137'
            '8de9daec1fc9a8d6bf92ae376723d812e7dc65e6a4b1ac82c9261f9b7ab271bf'
            '4f79a47832c68b8c68fa95c454b78a540fbac1b62bf5a63aa70bca18e4edef8c'
            '059e02c134b0fc7121993f2361da0477eb59209d99ffddedd1b6a0bcd806a4ff'
            'd15669b4705ac20cd03bafa621196c3c36620af0d7a3a2bfd17a3b1d72961f04'
            '701d66bf2fb306db0e539ee4546e9013a8a10170ff28092734f9b7eade7d5988'
            '2c07b15141e9acc73108a7b00e240f88b82bf6a8adebb9e5289f7116344c9ff6'
            'c4cda8d6a15ccfde4bcc8c852590eff6ef056dc29d94795b7fcc89446f289444'
            'e7966b37e08daa82ac8a128b032e13e1c5ce958e97d4dae54c9eec5640654434'
            'dde9f13f7d3e34437432a888e8ba5b330e8f88a47c03fd2e30130703aef92504')
sha256sums_x86_64=('1fefec8bf69f92a5d38202e38654e3789f9fbad0fc99ffba50b1b13f380f3168')
sha256sums_aarch64=('ec00b8daeb51be8063647199760d0f00a8d9d13682e17585fff46bf7051ace84')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for _template in *.toml; do
		install -Dm644 "${_template}" "${pkgdir}/usr/share/doc/${pkgname}/templates/${_template//-${pkgver/}}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
