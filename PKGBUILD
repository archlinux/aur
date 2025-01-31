# Maintainer: David Anderegg <dd.anderegg@hotmail.com>
# Contributor: David Anderegg <dd.anderegg@hotmail.com>

# Please download the installer file from your Tecplot Customer Portal and
# place it in the same folder as this PKGBUILD.

pkgname=tecplot
pkgver=2024r1
pkgrel=1
pkgdesc="Post-processing tool for CFD, other simulations and experimental data."
arch=('x86_64')
url="https://tecplot.com/"
_filename=tecplot360ex${pkgver}_linux64.sh
source=(
    "tecplot360.desktop" 
	"tecplot360.ico"
	"local://${_filename}"
)
sha256sums=(
	"4b8079bc02fb6b162b552eb3532deaa856e1ea6367d9b86442aa311a1cd21a23"
	"6a151032b1a70501aa0b667077b89e06349b730b03b765999aa8173f60df411e"
	"46012aab7e3f18d77344448d1e1a8d43a58f5e35fb0a296c593199810df4bc8e"
)

options=("!strip")

package() {
    prefix="${pkgdir}/opt/${pkgname}"

    # Fake install Tecplot in the current directory
    printf '%s\n' 'yes' ${prefix} | bash "${srcdir}/${_filename}" | tee

    # install .desktop file
    install -Dm644 "${srcdir}/tecplot360.desktop" \
	    "${pkgdir}/usr/share/applications/tecplot360.desktop"
    
    # install .ico file
    install -Dm644 "${srcdir}/tecplot360.ico" \
	    "${pkgdir}/usr/share/pixmaps/tecplot360.ico"

    # copy license
    install -Dm644 "${prefix}/360ex_2024r1/license.html" "${pkgdir}/usr/share/licenses/$pkgname/license.html"
}
