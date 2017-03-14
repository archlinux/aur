# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=ietf-cli
pkgver=1.14
pkgrel=2
pkgdesc="A commandline IETF RFC browser/utility"
arch=( 'i686' 'x86_64' )
url="https://trac.tools.ietf.org/tools/ietf-cli/"
license=('custom')
depends=( 'python' )
optdepends=( 'lynx: the default web browser specified in the config' )
_pkgname=ietf
install=
changelog=
noextract=()
source=("http://svn.tools.ietf.org/svn/tools/ietf-cli/ietf"
	"http://svn.tools.ietf.org/svn/tools/ietf-cli/ietf.config"
	"ietf.config.arch"
	"http://svn.tools.ietf.org/svn/tools/ietf-cli/ietf.README"
	"LICENSE"
        "ietf.sig"
	"ietf.config.sig"
	"ietf.config.arch.sig"
	"ietf.README.sig"
	"LICENSE.sig")
sha512sums=('cf16db6148c1110c6ff60995ada6354da3227be7ecf5e76df68ee05843a602fd5cf1e9ba1de9128efa84fc1c1e33de69d9db08c58f1cb565bdafe3e76191a6f0'
	    '68563ec320541618df4a91c942fa7062b34fa71d5761ad68134b92205dc9b6b6d95f20e0db6c8e6bf421d0d255ea15a9b60de1665faa1be9eff6e4eae5462a2a'
	    '9a0dc6f5a0bdaf15779568e177026f9c40a82b77564adb83eabf0a35e05e13fa070f2ab736fa04734721954169d00d8b4d4621d92138f4dee99fa3ce6076be52'
	    '871fb110699ecccbab9a96ecbbecbd7f28035fcf2caea6375d776c41ee683b0a38c6b982ce4bbb9441f069e57b225d0c3667db5affa0dbc85d622e6d505a3ca5'
	    '29dc31d0b0365f8b5037c846eb7f441f38249d25cf7aeba134777dddc422ff9faff92aded93bc03b21b4390153568543b2be0c92d09c667559dd78390654e70e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

prepare() {
	# We need to make this a little more package-friendly. Currently uses ("~/bin/ietf.config", "/usr/local/bin/ietf.config", "~/.ietf/ietf.config")
	cd ${srcdir}
	sed -i -re "s/^ConfigPlaces[[:space:]]*=[[:space:]]*\(.*$/ConfigPlaces = ('~\/.${_pkgname}.config', '~\/.${_pkgname}\/${_pkgname}.config', '\/etc\/${pkgname}\/${_pkgname}.config')/" ${_pkgname}
}

package() {
        install -D -m755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}.README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -D -m644 ${srcdir}/${_pkgname}.config.arch ${pkgdir}/etc/${pkgname}/${_pkgname}.config
	install -D -m644 ${srcdir}/${_pkgname}.config ${pkgdir}/usr/share/doc/${pkgname}/${_pkgname}.config
	install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/WTFPL
}
