# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal
pkgver=2.2
pkgrel=1
pkgdesc="mrcal is a generic toolkit built to solve the calibration and SFM-like problems we encounter at NASA/JPL."
arch=('i686' 'x86_64')
url="http://mrcal.secretsauce.net/"
license=('Apache')
groups=('')
depends=('libdogleg' 'python' 'python-numpy' 'python-numpysane')
makedepends=('make' 'gcc' 'perl-list-moreutils' 're2c' 'chrpath' 'fig2dev' 'emacs' 'htmlize-git')
optdepends=('')
provides=('mrcal')
conflicts=('mrcal')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dkogan/mrcal/archive/refs/tags/v${pkgver}.tar.gz"
        "build-fix-v${pkgver}.patch"
)

sha256sums=('872a3c5cf88ca3ee7354c87c385b64eee0fdf40d736a5d8e3efcf271f7bcbd7b'
            '2e14826f2a609ed9ef6aa2eb4ebcd8b31a695979f4c5b9b4f96e82064c036820')
sha512sums=('2ef3959ecc2a427b6997f3f96b343ddbf319beb0b2aa921d82b1c48ad1fe4401ebbdae53324bbfdf6c6f16c282156cea03bbaea281f70237d2d5816843442fa0'
            '942e2305be485c157799c224dd3347449a1c7b90bf69fea22f7fc2d28dd06fc0d754f7441dd08cffdadb6e23db89037c0c5c2b38014e94353ae227320498e5db')
b2sums=('d9782fc77cefc1fc88d3a6cac189007a956dc21956004e5c92337dfbbe53ff79e030ad3ddc2b3e54c416303fa43ead96d74b8b2d402532564fad6b0fcb6d9e6a'
        '319e59805b0c178af3120f388384e67ad2639664ca8796ba769dfe2e86e541317ed6f3ee58af9b41f2b7c6bbc0f8bfa44993e089accd2100d95f80d4e2fc126d')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/build-fix-v${pkgver}.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	#CFLAGS=`python-config --includes | awk '{n=split($2,a,"|");for(i=1;i<=n;++i)if(!seen[a[i]]++)print a[i]}' | sed 's!/usr/include!/usr/lib!' | sed 's!$!/site-packages/numpy/core/include!'`
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
