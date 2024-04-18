# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: runsisi <https://github.com/runsisi>

# Archlinux credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu credits:
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=mutter-x11-scaling
pkgver=46.0
pkgrel=4
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  harfbuzz
  iio-sensor-proxy
  lcms2
  libcanberra
  libcolord
  libdisplay-info
  libdrm
  libei
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libsysprof-capture
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  pixman
  python
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  gobject-introspection
  gtk3
  meson
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
checkdepends=(
  gnome-session
  python-dbusmock
  wireplumber
  zenity
)
provides=(mutter=$pkgver libmutter-14.so)
conflicts=(mutter)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/mutter.git#tag=$pkgver"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/7a54f849bdbe1b61c54a615dd51c7d9ec0e36131/0001-drm-buffer-gbm-Do-not-call-ensure_fb_id-from-lock_fr.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/7aa432d4366fdd5a2687a78848b25da4f8ab5c68/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  "https://salsa.debian.org/gnome-team/mutter/-/raw/e450692a81d20f65bea827212ce55236534711d3/debian/patches/debian/Support-Dynamic-triple-double-buffering.patch"
  "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3300.patch"
  "https://gitlab.manjaro.org/packages/extra/mutter-x11-scaling/-/raw/master/mutter-fix-x11-restart.patch"
  "https://gitlab.manjaro.org/packages/extra/mutter-x11-scaling/-/raw/master/compositor-x11-sync-again-at-the-end-of-before_paint.patch"
  "https://gitlab.manjaro.org/packages/extra/mutter-x11-scaling/-/raw/master/compositor-sync-ring-allow-the-gpu_fence-to-be-moved.patch"
)
b2sums=('04a14854c8ec2668a340b241102b7b2ebbc0387a9771a5bd2c2366419ee08e7ebb308f2288f4a64b9d08053e1897eb514a46802584d1590f8bcebde4a613afaa'
        'fed7d496b658a43b306e62a57c817c54990e8764103eae5479b8a96fbdf25da1ae6028126aa3cccda6239ff1f0c4e69bbe6f12e29804651c1a7b6ca40d6bf36c'
        '2b1a70b961d70688396c072355accdd8a9fa5591feab7a22c849f54bcf2695cbe72267dc5e006385e95d114e8e7078045fa8b6a09d00c558eff04ec8dd38318a'
        '8ba8479a1ff4d8eb471df781d4a2b0a83c6299136fc35b935e537fad7f4071013bce1c62d3d82bfc31c0d6f34c1229a2032f778023356b84f32962262e9ed0f5'
        'f7ed9db52afa4e02a77347a521cab7e1a438735a988ba6229909365e7acad001599eacb423fce37b3d1ca276d1584797c2afe3ae715f554de84d87e791978475'
        'ba4febdabc89a8c608d2a9621d02a21c05b315bb586f91d34b0369c07f3e051a6333d62dd97ab18d0c5b1c8f453696d4851c55fc82a50e8843ae45068ab178ca'
        '10d48fee50257775393f4ecf15d2736a8806c04dc39b8cfc2b1da51baee93859fb262505ee9c387b76cbe2598614602b3e6c86437b0fcbf485eaa79fe8ad3d10'
        '18727bb9bce8327595bcdc58c1c58ae67aef0718408a6d668bb24afb966d33736ad2d07f4eb05acdf2b9521b1d6abd15abe842c29113488826bfa97888c3ad6b')

prepare() {
  cd mutter
  
  # Merge Request: Enable Explicit Sync On Wayland
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3300
  patch -p1 -i "${srcdir}/3300.patch"

  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/7050
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3329
  git apply -3 ../mutter-fix-x11-restart.patch

  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3410
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3590
  git apply -3 ../compositor-x11-sync-again-at-the-end-of-before_paint.patch

  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3389
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3674
  git apply -3 ../0001-drm-buffer-gbm-Do-not-call-ensure_fb_id-from-lock_fr.patch

  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3384
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3685
  git apply -3 ../compositor-sync-ring-allow-the-gpu_fence-to-be-moved.patch

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  
  # Support Dynamic triple double buffering
  patch -p1 -i "${srcdir}/Support-Dynamic-triple-double-buffering.patch"
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  export NO_AT_BRIDGE=1 GTK_A11Y=none
  export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"

  # Tests fail:
  # mutter:cogl+cogl/conform / cogl-test-offscreen-texture-formats-gles2
  # mutter:core+mutter/stacking / fullscreen-maximize
  ## https://gitlab.gnome.org/GNOME/mutter/-/issues/3343
  xvfb-run -s '-nolisten local +iglx -noreset' \
    mutter/src/tests/meta-dbus-runner.py --launch=pipewire --launch=wireplumber \
    meson test -C build --no-suite 'mutter/kvm' --no-rebuild \
    --print-errorlogs --timeout-multiplier 10 --setup plain ||:
)

package() {
  meson install -C build --destdir "$pkgdir"
}
