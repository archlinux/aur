# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.25.4
_debver=1
pkgver=${_omver}
pkgrel=8
pkgdesc="A complete Modelica modeling and simulation environment (from pre-compiled Debian Trixie binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica')
conflicts=('openmodelica' 'openmodelica-git')

depends=(
    'glibc' 'gcc-libs' 'qt6-base' 'qt6-svg' 'qt6-webengine' 'qt6-declarative'
    'qt6-tools' 'qt6-5compat' 'lapack' 'blas' 'expat' 'curl' 'clang' 'cmake' 'mesa'
    'ncurses' 'readline' 'icu' 'unzip' 'zip' 'hwloc' 'libxml2' 'hdf5' 'boost-libs'
    'omniorb'
)

optdepends=(
    'gnuplot: For 2D plotting from scripts'
    'libxslt: For XML report and documentation generation' #listed as 'xsltproc' in .deb
    'texlive-latex: For DrModelica/DrControl documentation generation' #listed as 'texlive-latex-base' in .deb
    'texlive-bin: For rendering LaTeX equations in OMNotebook' #listed as 'dvipng' in .deb
    'texlive-binextra: For rendering LaTeX equations in OMNotebook' #listed as 'dvipng' in .deb
)

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib-trixie"

source=(
    "${_baseurl}/omc-common_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomcsimulation_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsensplugin_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell-terminal_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omnotebook_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omedit_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/drmodelica_${_omver}-${_debver}_all.deb"
    "${_baseurl}/drcontrol_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omlibrary_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomccpp_${_omver}-${_debver}_amd64.deb"
)

sha256sums=('14f670cfbba7b2a1d204862239e55b9ff8b310f7aa6515b9fa0981ee635f8c10'
            '69edff7d0c856084da67d227ae83ae2618010b97b0bdfbebf8686f7e8a85daab'
            'e7e11c76c811bee209fd717583e65dbaa25c10a340ca3472d8add6c599397469'
            'c06fed4c7d69521b9ab45f4d3b019847a910765b00509eaaf40f527fff6c95d9'
            '00fed9d45bac6cb9f0c5ec73bcd5401a5a35071aa4e5b4c9175b15f87c392196'
            '7a4da8e710ecab621bb521ee643ab620bfba8b8a4065e32ad33c1e4cb8f57805'
            '6fc744d6e35c075e9a4f966793ef0ae61f29325513e85cd411c849b2360928fb'
            'f13831cc0e6ac0de7b63e3b8eb27463afc41c126cffc0b9de638d25b264ccf4b'
            '4a40483af03eb342476485f2b12bef429ad42cd02512ea720186c342f4ca0a0d'
            '1bb7aaf811ce99dd81e16b02c325d4a0479993936c1cec0586da4828699053b9'
            '0bba85dbd0b6b4743c64642d810daa59d75c6ddd68b1623a64c062accbcdad5e'
            '35dbc9035987f97bf14d10c56e3a36522ba4f272fe01c4139e75eaa42ab25869'
            '96bfd213cca28d3b8f27050d17e708d1610151f8dc06cdff22208bed3ac02f25'
            '5f25d324bd80d1743c7f0ce5d69b724531f35854225611cab9e81b46047d816b'
            '1ef15b1195be7914058460dfb693cb20fee11dda1d4984a87a1f68b8ad45326c'
            '3160204a900c87448f0a7c682c089b136560e7e20e4de0985305a1fbacdf541c'
            'f9e6fe0d29a536d5d906f62cc4e841152d6d24f4faab5537f7d29da59a99be63')

package() {
    for deb in "${source[@]}"; do
        msg2 "Extracting $(basename "$deb")..."
        ar p "$srcdir/$(basename "$deb")" data.tar.xz | tar -xJ -C "$pkgdir/" --no-same-owner
    done

    install -d "$pkgdir/usr/share/applications"

    mv "$pkgdir/usr/share/applications/"{omedit,openmodelica-omedit}.desktop
    mv "$pkgdir/usr/share/applications/"{omnotebook,openmodelica-omnotebook}.desktop
    mv "$pkgdir/usr/share/applications/"{omshell,openmodelica-omshell}.desktop
}
