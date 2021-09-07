# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=sparta-plugins
pkgver=1.5.1
pkgrel=1
pkgdesc="A collection of spatial audio related VST plug-ins (loudspeaker/binaural panners, Ambisonics encoders/decoders/visualisers, etc.)"
arch=('x86_64')
url="https://github.com/leomccormack/SPARTA"
license=('GPL')
depends=("hdf5" "netcdf" "netcdf-fortran" "libglvnd" "freetype2" "libxinerama" "webkit2gtk" "gtk3" "libxext" "lapack" "libcurl-gnutls")
makedepends=()
optdepends=()
provides=("${pkgname}")
conflicts=()
_build_date="2021_08_23"
_file_name="Linux_SPARTA_${_build_date}_v${pkgver}"
source=("$url/releases/download/v$pkgver/$_file_name.zip")
md5sums=('9b85d35d4c301a4ffb466ccd7de97d7e')

package() {

	cd "$srcdir/${_file_name}"

	# Install libs
	install -Dm755 "libsaf_mkl_custom_lp64.so" "$pkgdir/usr/lib/libsaf_mkl_custom_lp64.so"
	install -Dm755 "libsaf_ipp_custom.so" "$pkgdir/usr/lib/libsaf_ipp_custom.so"

	# Install plugins
	PLUGINS=(
				"libcompass_6dof.so"
				"libcompass_array2sh.so"
				"libcompass_binaural.so"
				"libcompass_binauralVR.so"
				"libcompass_decoder.so"
				"libcompass_gravitator.so"
				"libcompass_sidechain.so"
				"libcompass_spatedit.so"
				"libcompass_tracker.so"
				"libcompass_upmixer.so"
				"libcropac_binaural.so"
				"libhodirac_binaural.so"
				"libhodirac_decoder.so"
				"libHOSIRR.so"
				"libsparta_ambiBIN.so"
				"libsparta_ambiDEC.so"
				"libsparta_ambiDRC.so"
				"libsparta_ambiENC.so"
				"libsparta_ambiRoomSim.so"
				"libsparta_array2sh.so"
				"libsparta_beamformer.so"
				"libsparta_binauraliser.so"
				"libsparta_decorrelator.so"
				"libsparta_matrixconv.so"
				"libsparta_multiconv.so"
				"libsparta_panner.so"
				"libsparta_pitchShifter.so"
				"libsparta_rotator.so"
				"libsparta_spreader.so"
				)

	for F in "${PLUGINS[@]}"; do install -Dm755 "$F"  "$pkgdir/usr/lib/vst/$F"; done

	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
