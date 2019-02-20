#Submitter: Carsten Feuls <archlinux@carstenfeuls.de>

_pkgname=thanos
pkgname=prometheus-$_pkgname
pkgver=0.3.1
pkgrel=2
pkgdesc="Highly available Prometheus setup with long term storage capabilities. (binary, not built from source)"
arch=("x86_64")
url="https://github.com/improbable-eng/thanos"
license=("Apache")
depends=()
makedepends=()
optdepends=('prometheus: To Store the data with thanos sidecar'
            'grafana: To display the Resulst von thanos Query'
            'minio: To Provide S3 Storage for sidecar and store')
backup=("etc/thanos/sidecar.conf"
        "etc/thanos/store.conf"
        "etc/thanos/query.conf"
        "etc/thanos/rule.conf"
        "etc/thanos/compact.conf"
        "etc/thanos/downsample.conf")

source_x86_64=("thanos-sidecar.service"
	       "thanos-store.service"
	       "thanos-query.service"
	       "thanos-rule.service"
	       "thanos-compact.service"
	       "thanos-downsample.service"
               "thanos-sidecar.conf"
               "thanos-store.conf"
               "thanos-query.conf"
               "thanos-rule.conf"
               "thanos-compact.conf"
               "thanos-downsample.conf"
               "thanos.sysuser"
               "https://github.com/improbable-eng/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.linux-amd64.tar.gz")

sha256sums_x86_64=('c5d8fe78aae3e3c5e32790e5a4e8f1ff4d4ac8e608926bf735a7e22a23a4531a'
                   'b48a1cdd78c56e010655a015bd89a06ae8b8ba9043aba7a518a9254a735b8f5d'
                   'f14e3dab682a4e2777ed4c02da1d2be677327f166588767047aa10e853f7d928'
                   '0e8b5a5be042c6bdb1f279bd835720007d13ea7624592aab0703fc1b8c871b75'
                   '03b829963a127cd8d65cd3da331a36cd8309517baad46aaed411ac16adb7f3f7'
                   '542f8cba235ac7a1d33b8a36eba4a39e152b0777a507b81edc0fe4c68b9357c8'
                   '2bcd2bdb25490982ef5ce6886836ece58f591c3bd4505655cb8babb374a5052b'
                   '5213e5e7187acddb5c2199782fdd0ca85aad93c221162c020c1cea1607b12a0c'
                   '29b5dc83449240ecd9554cead75196e4e4843da3b2ce62db66c9bac04c847027'
                   'f9eca0f9a2751255af2a1f3b992cd8a168851a296e0466c7c4a47ec804f46f74'
                   '572baa54d9191e7a26865efde62b9170cea41fdc5c94131ae2089b4b3961d3ab'
                   '3ec0605d3b8d2286f05c7ebfafcae87cf191caf65405e74b38f5e880cbdf08cd'
                   '0d2ee33fa0a91ea2a93c652fdcc8d50f2b69a3598bc6819f14c57239ce3fcc82'
                   'f523667428af6ec59c21822bab53061f14fe7bde72d23789ccd70fc282438444')

package() {
    cd "${srcdir}/$_pkgname-$pkgver.linux-amd64"

    # Install Binary
    install -D -m0755 thanos "${pkgdir}/usr/bin/thanos"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/thanos-sidecar.service" "${pkgdir}/usr/lib/systemd/system/thanos-sidecar.service"
    install -D -m0644 "${srcdir}/thanos-store.service" "${pkgdir}/usr/lib/systemd/system/thanos-store.service"
    install -D -m0644 "${srcdir}/thanos-query.service" "${pkgdir}/usr/lib/systemd/system/thanos-query.service"
    install -D -m0644 "${srcdir}/thanos-rule.service" "${pkgdir}/usr/lib/systemd/system/thanos-rule.service"
    install -D -m0644 "${srcdir}/thanos-compact.service" "${pkgdir}/usr/lib/systemd/system/thanos-compact.service"
    install -D -m0644 "${srcdir}/thanos-downsample.service" "${pkgdir}/usr/lib/systemd/system/thanos-downsample.service"
    install -D -m0644 "${srcdir}/thanos.sysuser" "${pkgdir}/usr/lib/sysusers.d/thanos.conf"

    install -d -m0755 -o212 -g212 "${pkgdir}/etc/thanos/"
    install -d -m0755 -o212 -g212 "${pkgdir}/etc/thanos/rules/"
    install -d -m0755 -o212 -g212 "${pkgdir}/var/lib/thanos/compact/"
    install -d -m0755 -o212 -g212 "${pkgdir}/var/lib/thanos/rule/"
    install -d -m0755 -o212 -g212 "${pkgdir}/var/lib/thanos/downsample/"


    # Install thanos config
    install -D -m644 -o212 -g212 "${srcdir}/thanos-sidecar.conf" "${pkgdir}/etc/thanos/sidecar.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos-store.conf" "${pkgdir}/etc/thanos/store.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos-query.conf" "${pkgdir}/etc/thanos/query.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos-rule.conf" "${pkgdir}/etc/thanos/rule.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos-compact.conf" "${pkgdir}/etc/thanos/compact.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos-downsample.conf" "${pkgdir}/etc/thanos/downsample.conf"
}
