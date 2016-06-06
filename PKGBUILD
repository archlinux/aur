# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=1.11.0
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
sha1sums=('8b051ee16b785b6db16657161aeed6cd6724f028'
          '67741bea89d102740e1d8726d20cf6d278d6d51e'
          '63b21515874749572d515266d49c202dbc560a43'
          '551571daaabab0ded8c1dc58cd45035fad3a6387'
          '96b73103c25811a7721a40487ad7ec5d9436fa11'
          'd1aab8b491b50dbcfceb96aa154df0bac04ec4f4'
          'c74abfd3e5ee691a889be8d03a841c96da6602c0'
          '5148c5ec24a98af3d33f65eabbba065f4556b212'
          '25634c91c587af648cb2428e2124c23e22e6025b'
          'a51dfacd54988910e909789e31bea43b9c2156fe'
          '350c82bee9bd06c0b678fabf08fcef405e832083'
          'c1db4cb0ac1d685a0c6e9d020238f8ea0c163318')

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
