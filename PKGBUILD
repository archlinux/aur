# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=google-cloud-cli-firestore-emulator
pkgver=548.0.0
pkgrel=1
pkgdesc='A google-cloud-cli component that provides a local, in-memory emulator for Firestore.'
arch=('x86_64')
url='https://cloud.google.com/firestore/docs/emulator'
license=('Apache-2.0')
depends=('google-cloud-cli' 'java-runtime')
options=('!strip')
source=("https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('c2050c35e8452d5f1c8c7ef1b92e465cbf1237d7163718a80ffda71e0a6f9be6')

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

    local _install_base="${pkgdir}/opt/google-cloud-cli"
    local _component_path="platform/cloud-firestore-emulator"

    # Install component manifest and snapshot
    manifests=(
        "cloud-firestore-emulator.manifest"
        "cloud-firestore-emulator.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 ".install/${item}" "${_install_base}/.install/${item}"
    done

    install -Dm755 "${_component_path}/cloud_firestore_emulator" "${_install_base}/${_component_path}/cloud_firestore_emulator"
    install -Dm644 "${_component_path}/cloud-firestore-emulator.jar" "${_install_base}/${_component_path}/cloud-firestore-emulator.jar"
}
