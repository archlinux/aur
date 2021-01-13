# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=thanos
pkgver=0.17.2
pkgrel=1
pkgdesc="Highly available Prometheus setup with long term storage capabilities"
arch=('x86_64')
url="https://thanos.io/"
license=('MIT')
makedepends=('go-pie' 'git')
backup=(
  'etc/thanos/compact.conf'
  'etc/thanos/downsample.conf'
  'etc/thanos/query.conf'
  'etc/thanos/query-frontend.conf'
  'etc/thanos/rule.conf'
  'etc/thanos/sidecar.conf'
  'etc/thanos/store.conf'
)
source=(
  "thanos-compact.service"
  "thanos-downsample.service"
  "thanos-query.service"
  "thanos-query-frontend.service"
  "thanos-rule.service"
  "thanos-sidecar.service"
  "thanos-store.service"
  "thanos-compact.conf"
  "thanos-downsample.conf"
  "thanos-query.conf"
  "thanos-query-frontend.conf"
  "thanos-rule.conf"
  "thanos-sidecar.conf"
  "thanos-store.conf"
  "thanos.sysuser"
  "https://github.com/thanos-io/thanos/archive/v${pkgver}.tar.gz"
)


build() {
  cd "thanos-$pkgver"
  mkdir bin
  PREFIX=${PWD}/bin make build
}

package() {
  cd "thanos-$pkgver"

  install -Dm0755 bin/thanos "${pkgdir}/usr/bin/thanos"
  install -D -m0644 "${srcdir}/thanos.sysuser" "${pkgdir}/usr/lib/sysusers.d/thanos.conf"

  install -d -m0755 "${pkgdir}/etc/thanos/"
  for componentname in compact downsample query query-frontend rule sidecar store; do
    install -Dm0644 "${srcdir}/thanos-${componentname}.service" "${pkgdir}/usr/lib/systemd/system/thanos-${componentname}.service"
    install -Dm0644 "${srcdir}/thanos-${componentname}.conf" "${pkgdir}/etc/thanos/${componentname}.conf"
  done
}
sha512sums=('8b99500bd2aee6f49993cdce2770e890cec5cbb2c18e104afbf9d95442a1cc011591f57c1e3b5a7d83e4e4104c52cdab1465976f3fa2f8c870091674fec443d6'
            '01075b8fbe5dc2bb714b7ebfaa802be775dd7698bf3331948626eef73285477935f403e4ed80c81e4aad423b190313722f1c9cfbf21359419ff47345852d7721'
            '49bc075ebfae0722f2e6d8574dd7b95e2fdc0ce9bc043f8d2590a26edf227868dbdbcf9795c4518526fcd33e267fd5dabcd28b7692a14f55bd56f7aa5df02a69'
            'c66c92cc40047c3c52f9264960e10315ef2bc244bbd52802388616f38bae970774c5353026ad5281e97e67962a9bb8e3699fe3efa013b663bca873a5f5da56ce'
            '4496090299274d92e178973bef9cb56b48079d1904bb39499dcefa78ef228803835a673a9ff922bec38aade845ec2423a7c1cfd63a194d418467b4cf4d73b45d'
            '311c4ca466c104bf790dcbb44750635d2ab825d46987e8cbd1282d13c6d24a8f5a1085652cab30f26b53407ed020e1b3b8bef5a53ef28cc06b54a14967cda8d3'
            '69bcf7bf672bdcbbe2ea0f1270494cdb9dd64f326eccbf4f103356463d7582b1e919b2b18869cd6b56061d4aa94c495f6bbd0da201c074a7c47ee21df7c8ef76'
            '04192c5c09ba9a8bf829af8e6f5ca984214088a4a9264bc66af2a21b8174721fa41a8096625bbb992291ca63c7442847217a7ac1117d418170496727adc4a656'
            '124c3ed959ca2abbcc68a22482b56a7fe3fb3db7886b822dd2dff41ced8e6bb26ab953c528772968cebed903cf8d1222480fea1e1e19797fe376e724c5465e7d'
            '94e96abfadd3c6066b171d7d80f5505698b4cc0f45d16ab61016ee4a5214e4e4515593294347730f52821eeac9a35b071c143d54cc654c55b9b0dd81fe78658b'
            'c322e7f054d54cd3359c2482da74af4bd748d3f8c5f5249885343a24092596c10cc68995b3470bba93d2bc2d48bada74705943d9d90ecba78f514930c45fb4be'
            '682b531c7dc3eb050ac01431fb88c1339f42bc9c357f37f90a8a536f40ac8e88340806f7907b9d3706e8824fba23f712c90432ab761c573f920a84dec7ddf8e9'
            '5f8da17393a10a1b62c0eef3895dae812de88b2cb3a37ef3d5596ecfd30d43f04533a76c4510907de655222c2e2b46f55b0e9a503fc08cfa5daac50b5fb3edf1'
            'd9b6da366d8eca19062471ed4b0c96b7762069e5235953d71aa796ef8fe184ad82acf235fd9bfeaaf62a3f47ba1ef412958d91b5975e18416e3d0127a5338db9'
            '7921e4320877e4783ba40a29869618d53d2a1a8403527b174ad1e5f0115e610e3882d812ba5ae427d5a84dc8c559ff81ce787e3cf38c9004e242f9b8e6347325'
            '455f96b51703afba9e398b1945cd1e6a7e3eccedb95909c5c56408f197d266aa321e6a3bf8bd062f4b16660c7cd22847221d564c961367f1c29bc121a021b456')
