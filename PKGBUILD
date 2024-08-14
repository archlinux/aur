# Maintainer: Tomasz Bursztyka <tomasz dot bursztyka at proton dot me>

pkgname=openmotor
pkgver=0.6.0
pkgrel=1
pkgdesc="Internal ballistics simulator for rocket motor experimenters"
arch=("any")
url="https://github.com/reilleya/openMotor"
license=("MIT")
depends=("docopt>=0.6.2"
	 "python-appdirs>=1.4.4"
	 "python-cycler>=0.11.0"
	 "python-decorator>=5.1.1"
	 "python-ezdxf>=1.0.3"
	 "python-imageio>=2.31.0"
	 "python-matplotlib>=3.7.1"
	 "python-networkx>=3.1"
	 "python-numpy1>=1.24.3"
	 "python-pillow>=9.5.0"
	 "python-pyparsing>=3.0.9"
	 "python-pyqt6>=6.4.2"
	 "python-pyqt6-sip>=13.4.1"
	 "python-dateutil>=2.8.2"
	 "python-yaml>=6.0"
	 "python-scikit-fmm>=2023.4.2"
	 "python-scikit-image>=0.21.0"
	 "python-six>=1.16.0"
	 "python-sphinx>=7.0.1")
makedepends=("git"
	     "python-pyqt-distutils"
	     "python-setuptools")
source=("git+https://github.com/reilleya/openMotor.git")
sha256sums=("SKIP")

build() {
    cd "openMotor"
    python setup.py build_ui
}

package() {
    cd "openMotor"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/openMotor"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/openMotor"
    install -Dm444 app.py -t "${pkgdir}/usr/share/openMotor"
    install -Dm444 main.py -t "${pkgdir}/usr/share/openMotor"
    cp -r uilib "${pkgdir}/usr/share/openMotor"
    cp -r motorlib -t "${pkgdir}/usr/share/openMotor"
    touch openMotor
    echo -e "#!/bin/sh\npython3 /usr/share/openMotor/main.py\n" >> openMotor
    install -Dm755 openMotor -t "${pkgdir}/usr/bin/"
}
