# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
# Contributor: Michael Düll <mail@akurei.me>
# Contributor: sancspi <sancospi [at] gmail.com>
# Contributor: tze <tze@datalove.me>

pkgname=jcryptool
pkgver=0.9.9
pkgrel=2
pkgdesc="A cryptographer's e-learning application. You can use it to apply and analyse cryptographic algorithms."
arch=('i686' 'x86_64')
license=('EPL')
url="http://www.cryptool.org/en/jcryptool"
depends=('glibc' 'java-environment' 'python2' 'libxext' 'libxrender' 'fontconfig')
install=jcryptool.install
_arch='x86_64'
[ "$CARCH" = 'i686' ] && _arch='x86'
[ "$CARCH" = 'i686' ] && sha512sums[0]='44fd4bd14965a00901b30619ad2ca0b18b63d0bfc22d64a68a5a638ec9eb8091cc7c6217b368461b41215f08345825e87d5af84da46bea8927e6ec5a538f78b0'

# Weekly build version keep us up-to-date 
source=(
http://www.cryptool.org/jctdownload/Builds/downloads/weekly/${pkgname}-${pkgver}-linux.gtk.${_arch}.tar.gz
jcryptool.desktop
jcryptool.png
)

prepare() {
    cd "$srcdir/$pkgname"
    find . -type f -iname "*.py" -exec sed -i "s#/usr/bin/python#/usr/bin/env python2#g" {} \;
}

package() {
	install -dm644 ${pkgdir}/opt/${pkgname}
	cp -ar ${pkgname} ${pkgdir}/opt

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}
sha512sums=('072a663b854473b6a9a7291c7601a4fed6b2655d9954b120890b5d0a7fefc57931dd4f27d6fb2c88b0c4982275ebc1340f804279148af012592439f765450393'
            'd0bd2e8b4a52b52280c9dcf45ae1e1db11876dfe6cefd34e095f5218c4c9fabb1abefcd38c92f74e3ef1b825794d720655dc45a03f08cbfc3f5b01f1f5994302'
            'e5e0ac2721ad3919b85fdf7da2fc14d491e89965aabf4c7ca6db840b70bd72ca37ddb63222ee21727607348651125fb34c5e62c2cb9d49e5856678187cb35f6c')
