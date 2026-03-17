# Maintainer: kpj <kim.philipp.jablonski@gmail.com>

pkgname=nvidia-gpu-exporter-bin
_pkgname=nvidia-gpu-exporter
pkgver=1.4.1
pkgrel=1
pkgdesc="Nvidia GPU exporter for prometheus using nvidia-smi binary"
arch=(x86_64)
url="https://github.com/utkuozdemir/nvidia_gpu_exporter"
license=(MIT)
source=(
    "https://github.com/utkuozdemir/nvidia_gpu_exporter/releases/download/v$pkgver/nvidia_gpu_exporter_${pkgver}_linux_x86_64.tar.gz"
    "$_pkgname.sysusers"
    "$_pkgname.service"
)
b2sums=(
    "847a7e09e7dceefc8a9f5f9c21d1111b3a4c1067a680418b0cbbc3854b84eb16bb15604c3abffd9a58b37c27169a89f7f62e173548a1550077080960dbebb4c4"
    "fb56cec66cfcbb783715f29f287034fb7c9d92afacce5944f1a36eda94a803defc725fb865b7a548db26ca049ae2f471e2cebea06a11ff4a95d0d74e3b953c99"
    "f8ba515c24042470afe57a8fc47f3573036bfb8af6be00f916adc6a1acb1e954016deb65c4816ec8f694db0f2505a0ba9c74707bb6ff610ae79e73413037d697"
)


package() {
    # systemd
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

    # binary
    install -Dm755 "$srcdir/${_pkgname//-/_}" "$pkgdir/usr/bin/$_pkgname"

    # license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
