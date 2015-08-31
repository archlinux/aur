# Maintainer: hadrons123 <piruthviraj@gmail.com>
# Maintainer: Shanto <shanto@hotmail.com>
# Maintainer: Maarten de Boer <maarten@ikfixjewebstek.nl>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: Andre Fettouhi <A.Fettouhi@gmail.com>

pkgname=freetype2-infinality
pkgver=2.6
pkgrel=1
pkgdesc="TrueType font rendering library with infinality patch"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/bohoomil/fontconfig-ultimate"
depends=('zlib' 'bzip2' 'sh')
optdepends=(
	'fontconfig-infinality: Infinality package for fontconfig (required)'
)
conflicts=('freetype2')
provides=("freetype2=$pkgver")
options=('!libtool')
install='install.sh'
backup=('etc/profile.d/infinality-settings.sh')
source=(
	"http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2"
	"infinality-settings.sh"
	"01-freetype-2.6-enable-valid.patch"
	"02-upstream-2015.08.24.patch.xz"
	"03-infinality-2.6-2015.08.24.patch")
sha256sums=('8469fb8124764f85029cc8247c31e132a2c5e51084ddce2a44ea32ee4ae8347e'
            '21192ce47be46ccd44e8aeea99754d4e5e38cb52717f752d67c319c74fea2716'
            '086c9874ba5217dab419ac03dbc5ad6480aaa67b3c9d802f7181d8a3e007f8eb'
            '62eaa124f09916e237be994890178fb041b3648223f08429566df3a962971d8a'
            '241de84ca25d7ff106a3ebd5121d12a315abe5a72771957bd674e8b2e41c97d2')

build() {
	cd "${srcdir}/freetype-${pkgver}"
	
	patch -Np1 -i ../01-freetype-2.6-enable-valid.patch
	patch -Np1 -i ../02-upstream-2015.08.24.patch
	patch -Np1 -i ../03-infinality-2.6-2015.08.24.patch

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/freetype-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -T "${srcdir}/infinality-settings.sh" "${pkgdir}/etc/profile.d/infinality-settings.sh"
}
