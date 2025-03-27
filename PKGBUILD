pkgbase=vital-synth-bin
pkgname=("${pkgbase/-bin/}-clap-bin" "${pkgbase/-bin/}-vst-bin" "${pkgbase/-bin/}-vst3-bin" "${pkgbase/-bin/}-standalone-bin" )
pkgver=1.5.5
pkgrel=5
pkgdesc="Spectral warping wavetable synth"
arch=('x86_64')
url='https://vital.audio'
license=('EULA')
groups=('pro-audio')
replaces=('vital-synth')
makedepends=(
	'unzip'
	'xdg-user-dirs'
)
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glib2'
	'glibc'
	'libglvnd'
	'libsecret'
)
source=(
	'Vital Synth.desktop'
	'vital-synth.png'
)
sha512sums=(
	'8467ed1ce37c2971e78d44564393dd61a798567a4db8f83369dad6d29db1c1fa7a7c14fbe9dec0bac5cdafe2a1b6a466c977947d831ceacd28739e2bdd102bca'
	'f3b94039bd91b9f2cf2115105aefd4cbaa81b6570c334bd04d7c8d56b0a604f8e48a464ad3f05989fc0604ef13fc0936ecee124c624e3baf4891ad78c5fd5b34'
)
b2sums=(
	'3f495205a368cbc7e7c53ea70cea2817aeedd9f0ca78fbea27adc7f9556c5971102cee83a0326a2d3d4223fe9b1a9e478bbc788fb7ffa73cfdc05cf6863fc045'
	'ecfe9e554665b046987526e430d477f4e5fb06be1a2f6b34fb6faf3d3b7c5f460e870e78089e0b986e9e24f6b1bf4f3a21fef05502a01a5708d9703b00a836f4'
)

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/VitalInstaller.zip" "${srcdir}/VitalInstaller.zip"
	unzip "${srcdir}/VitalInstaller.zip"
}

package_vital-synth-clap-bin() {
    pkgdesc+=' - CLAP plugin'
    groups+=('clap-plugins')
    depends=(
        "${_common_depends[@]}"
        'clap-host'
      )
    install -vDm644 "$srcdir/VitalInstaller/lib/clap/Vital.clap" "$pkgdir/usr/lib/clap/Vital.clap"
}

package_vital-synth-vst-bin() {
    pkgdesc+=' - VST plugin'
    groups+=('vst-plugins')
    depends=(
          "${_common_depends[@]}"
          'vst-host'
        )
    install -vDm755 "$srcdir/VitalInstaller/lib/vst/Vital.so" "$pkgdir/usr/lib/vst/Vital.so"
}

package_vital-synth-vst3-bin() {
    pkgdesc+=' - VST3 plugin'
    groups+=('vst3-plugins')
    depends=(
      "${_common_depends[@]}"
      'vst3-host'
    )
    install -vDm755 "$srcdir/VitalInstaller/lib/vst3/Vital.vst3/Contents/x86_64-linux/Vital.so" "$pkgdir/usr/lib/vst3/Vital.vst3/Contents/x86_64-linux/Vital.so"
}

package_vital-synth-standalone-bin() {
    pkgdesc+=' - standalone'
    depends=("${_common_depends[@]}")
    optdepends=(
        'jack: audio backend'
        'alsa-lib: audio-backend'
      )
    install -vDm755 "$srcdir/VitalInstaller/bin/Vital" "$pkgdir/usr/bin/Vital"
    install -vDm644 "$srcdir/vital-synth.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/vital-synth.png"
    install -vDm644 "$srcdir/Vital Synth.desktop" "$pkgdir/usr/share/applications/Vital Synth.desktop"
}
