# Maintainer: Fabian Bornschein <plusfabi[AT+thegoogleadress]>

pkgname=amdgpu-experimental
pkgver=20200411
pkgrel=0
pkgdesc="Enables experimental features for AMDGPU"
arch=('x86_64')
url="https://gitlab.com/Fabish"
license=('Apache')
depends=('systemd' 'linux' 'mesa' 'vulkan-radeon')
makedepends=('lsb-release')
install="${pkgname}.install"
source=("71-radv.conf"
		"91-amdgpu-experimental.hook"
		"91-amdgpu.deep_color.conf"
		"91-amdgpu.exp_hw_support.conf")
sha512sums=('ad6432bb9d527aaa8a66cc2aeebe92dd4e1d3152cc5fffdf72cb662cb44a5bdacc1ac7222216feb3d5e4b810243e9be4b575d770974898d1bd689f75f71933d8'
            '763469b1530ba744a1155418e0ce4e17c70f658f8a425aa11f57627d86963511c4534e2722fa4a14abf6eff64a8957695bd995e05dfd0487d1ac89917dd93911'
            '4cbb7ffc42cb0a251ed15465dbc037cf5dba88aed0e220802f5d77d652abd4045e35d295b5b3a56d2150add21a66e304ee93cb57b93df0aca2d9f71d5c22ae8a'
            '651fc2269bf583bae4357a3c1a12a1391506ae1e55be1b37e75725596e875dee0ef4d7e064363449ffa39c4276071db4e6d20fbf212682f74056de5ab3576bdc')
if [[ $(/usr/bin/lsb_release -is) != "Arch" ]] ; then exit 1; fi

package() {
	# CONTENT
	cd "${srcdir}"

	# Install contents
    /usr/bin/install -D -m644 "${srcdir}/91-amdgpu-experimental.hook" \
    	"${pkgdir}/usr/share/libalpm/hooks/91-amdgpu-experimental.hook"
	
	/usr/bin/install -D -m644 "${srcdir}/71-radv.conf" \
		"${pkgdir}/usr/lib/environment.d/71-radv.conf"
								
    /usr/bin/install -D -m644 "${srcdir}/91-amdgpu.deep_color.conf" \
    	"${pkgdir}/usr/lib/modprobe.d/91-amdgpu.deep_color.conf"
    	
    /usr/bin/install -D -m644 "${srcdir}/91-amdgpu.exp_hw_support.conf" \
    	"${pkgdir}/usr/lib/modprobe.d/91-amdgpu.exp_hw_support.conf"
}
