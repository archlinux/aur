# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=1.12.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('i686' 'x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libunwind' 'poppler-glib' 'mtdev' 'libxcursor' 'glu' 'pango' 'colord')
makedepends=('wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("http://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
          '0001-gl-renderer-Rename-gl_renderer_create-to-gl_renderer.patch'
          '0002-gl-renderer-Rename-gl_renderer-output_create-to-outp.patch'
          '0003-gl-renderer-Rename-attribs-param-of-gl_renderer-to-c.patch'
          '0004-gl-renderer-Add-platform_attribs-param-to-gl_rendere.patch'
          '0005-gl-renderer-Accept-non-NULL-empty-visual_id-arrays.patch'
          '0006-gl-renderer-Refactor-gl_renderer_output_window_creat.patch'
          '0007-gl-renderer-Add-EGLDevice-enumeration-support.patch'
          '0008-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
          '0009-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
          '0010-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0011-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch')
sha256sums=('ac7ac2a32e3b9f50131fccded5d2326bd36b2226712d90b61999118a09af5033'
            'f8186d1d5229e838ca77b655792a3b0b4d9c329859df1d900d501f5ef4aec1af'
            'f600db2a8e71697a229b4f7f8052992b5ad41a99e273adf7119cb9e428de59a9'
            'bb807ce209fbf0381bc2fb61ad3251ecf0f266dfb20f90a54cc3c2517b6ba1b8'
            '09fcb3685832ac3c891004029cc2863ea999b18af2ce3f9806bc208a8da368b5'
            '02e232526a7c4ad3b543645135eddd5f945a8531e1436bfccebccf07b193fd87'
            'c789174b8f44f5c8835ad125f9f3a3b3637e2ca47c8ec1424202dc0b96cfb266'
            '4a3ed4667158da25511f113df87e93bb73dd053a7593fb754486f3a44495f617'
            'c3a4dbe92e5e16fc486a389dc5e09e55ff064c4e7ac96cdf2bc7edc4f7bd0387'
            'f3bab7e342e8267b8f60a33a3fdd839fb3461869945b55783e2a726119394aab'
            '995691ee0dbdd21b864d806281c832ea6ed42623315176d9774a0a078999029a'
            'd12b9820df5331dd0bb7e99a28a862009e0def600166d735dda330ea41e8b15e')

prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Rename-gl_renderer_create-to-gl_renderer.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Rename-gl_renderer-output_create-to-outp.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Rename-attribs-param-of-gl_renderer-to-c.patch"
	patch -Np1 -i "${srcdir}/0004-gl-renderer-Add-platform_attribs-param-to-gl_rendere.patch"
	patch -Np1 -i "${srcdir}/0005-gl-renderer-Accept-non-NULL-empty-visual_id-arrays.patch"
	patch -Np1 -i "${srcdir}/0006-gl-renderer-Refactor-gl_renderer_output_window_creat.patch"
	patch -Np1 -i "${srcdir}/0007-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0008-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0009-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0010-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0011-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
}

build() {
	cd weston-$pkgver
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-libinput-backend \
		--enable-demo-clients-install
	make
}

package() {
	cd weston-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
