# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=1.12.0
pkgrel=2
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
          '0011-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
          '0012-Add-nvidia-release-notes-file.patch')
sha256sums=('ac7ac2a32e3b9f50131fccded5d2326bd36b2226712d90b61999118a09af5033'
            'dc51d39b460385eff7694f11aa3096896a58246f0d0ffdcd77ac9d07bf4781d7'
            'e9088f7fa816d8c04bfa0abfcbb0c33b436cea157efce03663202131bcf8a053'
            '2abc0c12a7c3465c2289e6940f538cf6cb46f4f9c57eff1884b15134a460ef2e'
            '9e9cb4ee001d62c09753994225d944b3eb90788d29b69b1d3ffead38c09c8934'
            '7492e7d6b3d4d8a95433cbc845117746e48047794422c28b37c16fe60078a6f8'
            'd7ae91ed894a17d578371be877ebd0ab2204522f5f17388ea3ef0714afe85bba'
            '1a703d7743b55ccbe934389b1c4430f4f4535f4864439b86097b80d1b42e7e2c'
            'd5a8fddd8ddae650a283915478e8d41669a1dcc953df4317b5d178e14221fa4a'
            'fb759e98bffb406904366b735f7f50f2726a2a1c6700a9cf544d4c763f46bbfa'
            '8b6ef50772bf02adb951266ad5d973a701dd147fc168d8d6fa7cbafe0900dbda'
            '7838e7de7ac5b7fe4e98392235907333d4977939a487ff4cf2a2bd8756fc49cb'
            'f916ded74db76cfe3566654b5dc5a90b214a1572ffd7c15aa5e577ceabc22ab4')

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
	patch -Np1 -i "${srcdir}/0012-Add-nvidia-release-notes-file.patch"
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
